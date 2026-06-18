package ProjectsPatterns.Strukturalne.Fasada;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
public class Main {
    public static void main(String[] args) {
        ScanFasade scanFasade = new ScanFasade();
        scanFasade.Scan("asdasd");
    }
}
class QualityScanner{
    public Collection<String> QualityScan(String githubURL){
        System.out.println("Quality scan");
        List<String> list = new ArrayList<>();
        list.add("Error1");
        return list;
    }
}
interface IEnumerable{

}
class SecurityScanner{
    public Collection<String> SecurityScan(String githubURL){
        System.out.println("Security scan");
        List<String> list = new ArrayList<>();
        list.add("Security error 1");
        return list;
    }
}
class DependencyScanner{
    public Collection<String> DependencyScan(String githubURL){
        System.out.println("Dependency scan");
        List<String> list = new ArrayList<>();
        list.add("Dependency error 1");
        return list;
    }
}
class RaportGenerator{
    public void GenerateReport(Collection<String> qualityScanErros,
                               Collection<String> securityScanErrors,
                               Collection<String> dependencyScanRerros){
        System.out.println("QualityScan Erors");
        System.out.println(String.join(",", qualityScanErros));

        System.out.println("securityScanErrors Erors");
        System.out.println(String.join(",", securityScanErrors));

        System.out.println("dependencyScanRerros Erors");
        System.out.println(String.join(",", dependencyScanRerros));
    }
}

class ScanFasade{
    private QualityScanner qualityScanner = new QualityScanner();
    private SecurityScanner securityScanner = new SecurityScanner();
    private DependencyScanner dependencyScanner = new DependencyScanner();
    private RaportGenerator raportGenerator = new RaportGenerator();
    public void Scan(String githubURL){
        var qualityScanErrors = qualityScanner.QualityScan(githubURL);
        var securityScanErrors = securityScanner.SecurityScan(githubURL);
        var dependencyScanErrors = dependencyScanner.DependencyScan(githubURL);

        System.out.println("Scan report");
        raportGenerator.GenerateReport(qualityScanErrors,securityScanErrors,dependencyScanErrors);
    }
}