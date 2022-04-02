class APIs {
  APIs._();

//api key
  static const String apiKey = "2eeb16bde5bc4ec9814afb9fda4e59e5";

  // Base url
  static const String baseUrl = "https://newsapi.org";

  //article list api
  static const String articles =
      "$baseUrl/v2/top-headlines?sources=techcrunch&apiKey=$apiKey";

  //similar news
  static const String similarNews =
      "$baseUrl/v2/everything?domains=wsj.com&apiKey=$apiKey";
}
