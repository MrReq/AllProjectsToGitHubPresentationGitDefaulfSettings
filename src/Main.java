import java.io.IOException;
import java.nio.file.*;
import static java.nio.file.StandardWatchEventKinds.*;
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
class FolderWatcher {

    public static void main(String[] args) throws Exception {

        Path root = Paths.get("src");

        WatchService watchService = FileSystems.getDefault().newWatchService();

        root.register(
                watchService,
                ENTRY_CREATE
        );

        System.out.println("Nasłuchiwanie folderu: " + root);

        while (true) {
            WatchKey key = watchService.take();

            for (WatchEvent<?> event : key.pollEvents()) {

                if (event.kind() == ENTRY_CREATE) {

                    Path created = root.resolve((Path) event.context());

                    if (Files.isDirectory(created)) {

                        String folderName = created.getFileName().toString();

                        Path file = created.resolve(folderName + ".txt");

                        try {
                            Files.createFile(file);
                            System.out.println("Utworzono: " + file);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

            boolean valid = key.reset();

            if (!valid) {
                break;
            }
        }
    }
}