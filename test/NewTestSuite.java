/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.*;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 *
 * @author Renan Roeder 09
 * -11-2017
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({

        TesteEmissor.class,
        TesteOcorrenciaPolicial.class,
        OcorrenciaDefesaCivilTest.class,
        TesteOcorrenciaMedica.class,
        TesteReceptor.class,
        TesteTipoOcorrenciaBombeiro.class,
        TesteTipoOcorrenciaDefesaCivil.class,
        TesteTipoOcorrenciaMedica.class,
        TesteTipoOcorrenciaPolicial.class

})
public class NewTestSuite {
    
}
