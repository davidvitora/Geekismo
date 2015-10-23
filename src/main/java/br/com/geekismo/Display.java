package br.com.geekismo;

import br.com.geekismo.persistencia.entidade.Artigo;
import br.com.geekismo.persistencia.jdbc.ArtigoDAO;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class Display {
    
    public static int mapeacao(int artigosAtivos, int limiteArtigo ){
        int aux = artigosAtivos;
        do {
                if( aux % limiteArtigo == 0  ){
                    aux = 3;
                }
                else if( aux % limiteArtigo > 3 )
                    aux = aux / limiteArtigo;
                else    
                    aux = aux % limiteArtigo;            
            }
        while( aux > 3);
            
        aux = Math.abs( aux - limiteArtigo );
            //Fim do processo.. diferença encontrada          
            return aux;
    }
    
    
    public static int selecao(int aux, int i, int paginaAtual, int contPaginas){
        
        int pp = Math.abs(paginaAtual - contPaginas);
        int numero = ((i + pp * 3) - aux);
         //Fim do processo.. variavel calculada
        
        return numero;
    }
    public static List<Artigo> getArtigos(int artigosAtivos, int paginaAtual, int contPaginas) throws ClassNotFoundException{
        int i , um, dois, tres;
        ArtigoDAO controlador = new ArtigoDAO();
        
        int artigo;
            
                um= Display.selecao(Display.mapeacao(artigosAtivos, 3), 3, paginaAtual, contPaginas);
                dois = Display.selecao(Display.mapeacao(artigosAtivos, 3), 2, paginaAtual, contPaginas);
                tres = Display.selecao(Display.mapeacao(artigosAtivos, 3), 1, paginaAtual, contPaginas); 
                return controlador.getArtigos(um,dois,tres);
    }
    
}