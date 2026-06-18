//package Projekty.WzorceProjektowe.Strukturalne.Posrednik;
//import java.util.Dictionary;
//import java.util.Enumeration;
//
//public class Main {
//    public static void main(String[] args) {
//
//    }
//}
//interface IYoutubeService{
//    public byte[] GetVideo(int videoID){
//        byte[] tab = new byte[];
//        return tab;
//    }
//}
//class YoutubeService implements IYoutubeService{
//    private YoutubeService youtubeService;
//    private Dictionary<Integer, byte[]> cache = new Dictionary<Integer, byte[]>() {
//
//    };
//    public YoutubeService(YoutubeService youtubeService){
//        this.youtubeService=youtubeService;
//    }
//    @Override
//    public byte[] GetVideo(int videoID) {
//        System.out.println("Youtube service downloading"+videoID);
//        var video = youtubeService.GetVideo(videoID);
//        byte[] cachedVideo;
//        if(cache.Try(videoID,cachedVideo)){
//            System.out.println("getting from cache "+videoID);
//            return cachedVideo;
//        }
//
//        var vide = youtubeService.GetVideo(videoID);
//        cache.Add(videoID,video);
//        return video;
//    }
//}