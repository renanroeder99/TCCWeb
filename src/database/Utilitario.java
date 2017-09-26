package database;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.Calendar;

public class Utilitario {

    public static String gerarHASH(String senha){
        try {
            MessageDigest msg = MessageDigest.getInstance("SHA-512");
            byte messageDigest[] = msg.digest(senha.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for(byte b : messageDigest) {
                sb.append(String.format("%02X", 0xFF & b));

            }
            return sb.toString();
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
            return "";
        }

    }

    public static Date retornarPadraoSQL(String valor) {
        String[] numeros = valor.split("/");
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, Integer.parseInt(numeros[0] ));
        calendar.set(Calendar.MONTH, Integer.parseInt(numeros[1]));
        calendar.set(Calendar.YEAR,  Integer.parseInt(numeros[2]));
        return new Date(calendar.getTimeInMillis());
    }

    public static String retornarPadraoBR(Date data) {
        String valor = data.toString();
        String[] numeros = valor.split("-");
        return numeros[2] + "/" + numeros[1] + "/" + numeros[0];
    }

}
