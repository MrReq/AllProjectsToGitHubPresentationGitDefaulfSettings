package ProjectsPatterns.Behawioralne.FabrykaFactory;

interface Notification {
    void send(String message);
}

// Konkretny produkt 1
class EmailNotification implements Notification {

    @Override
    public void send(String message) {
        System.out.println("Wysyłam e-mail: " + message);
    }
}

// Konkretny produkt 2
class SmsNotification implements Notification {

    @Override
    public void send(String message) {
        System.out.println("Wysyłam SMS: " + message);
    }
}

// Konkretny produkt 3
class PushNotification implements Notification {

    @Override
    public void send(String message) {
        System.out.println("Wysyłam powiadomienie PUSH: " + message);
    }
}

// Fabryka abstrakcyjna (Creator)
abstract class NotificationFactory {

    // Metoda wytwórcza
    public abstract Notification createNotification();

    // Wspólna logika korzystająca z produktu
    public void notifyUser(String message) {
        Notification notification = createNotification();
        notification.send(message);
    }
}

// Konkretna fabryka 1
class EmailNotificationFactory extends NotificationFactory {

    @Override
    public Notification createNotification() {
        return new EmailNotification();
    }
}

// Konkretna fabryka 2
class SmsNotificationFactory extends NotificationFactory {

    @Override
    public Notification createNotification() {
        return new SmsNotification();
    }
}

// Konkretna fabryka 3
class PushNotificationFactory extends NotificationFactory {

    @Override
    public Notification createNotification() {
        return new PushNotification();
    }
}

// Klasa uruchomieniowa
public class Main {

    public static void main(String[] args) {

        NotificationFactory factory;

        factory = new EmailNotificationFactory();
        factory.notifyUser("Witaj użytkowniku!");

        factory = new SmsNotificationFactory();
        factory.notifyUser("Twoje zamówienie jest gotowe.");

        factory = new PushNotificationFactory();
        factory.notifyUser("Masz nową wiadomość.");
    }
}
