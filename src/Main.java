import java.io.IOException;
import java.nio.file.*;
public class Main {
    public static void main(String[] args) {
        Path root = Paths.get("src");

        try {
            Files.walk(root)
                    .filter(Files::isDirectory)
                    .forEach(folder -> {
                        Path file = folder.resolve("plik.txt");

                        try {
                            if (!Files.exists(file)) {
                                Files.createFile(file);
                                System.out.println("Utworzono: " + file);
                            }
                        } catch (IOException e) {
                            System.out.println("Błąd: " + file);
                        }
                    });

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

class RenameFiles {

    public static void main(String[] args) {
        Path root = Paths.get("src");

        try {
            Files.walk(root)
                    .filter(Files::isDirectory)
                    .forEach(folder -> {
                        Path oldFile = folder.resolve("plik.txt");

                        if (Files.exists(oldFile)) {
                            String folderName = folder.getFileName().toString();
                            Path newFile = folder.resolve(folderName + ".txt");

                            try {
                                Files.move(
                                        oldFile,
                                        newFile,
                                        StandardCopyOption.REPLACE_EXISTING
                                );

                                System.out.println(
                                        oldFile.getFileName()
                                                + " -> "
                                                + newFile.getFileName()
                                );

                            } catch (IOException e) {
                                System.out.println("Błąd przy: " + folder);
                            }
                        }
                    });

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
