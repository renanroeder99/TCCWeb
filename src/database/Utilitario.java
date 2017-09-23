package database;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

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

}
