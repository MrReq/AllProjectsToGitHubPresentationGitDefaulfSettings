package BibliotekiIJary.ApacheHttpClient;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.core5.http.io.entity.EntityUtils;
public class Main {
    public static void main(String[] args) {

        try (CloseableHttpClient client = HttpClients.createDefault()) {

            HttpGet request = new HttpGet("https://jsonplaceholder.typicode.com/posts/1");

            try (CloseableHttpResponse response = client.execute(request)) {

                String body = EntityUtils.toString(response.getEntity());

                System.out.println("Status: " + response.getCode());

                System.out.println();

                System.out.println(body);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
