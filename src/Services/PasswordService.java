package Services;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordService {

    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    public static boolean verifyPassword(String password, String hashedPassword) {
        if (hashedPassword == null || !hashedPassword.startsWith("$2a$")) {
            throw new IllegalArgumentException("Format hash tidak valid");
        }
        return BCrypt.checkpw(password, hashedPassword);
    }

}