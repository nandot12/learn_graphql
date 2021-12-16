

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QueryDatabase {


  static String getUser = """
  query MyQuery {
User{
  name
  email
  address
}
}

""";

  static String addData =  """
  mutation AddUser(\$name:String,\$email:String,\$address:String){
  insert_User(objects : {name : \$name,email :\$email,address :\$address}){
    
    returning{
      name
      email
      address
    }
  }
}

""";

  static HttpLink httpLink =
  HttpLink("https://superb-dane-72.hasura.app/v1/graphql", defaultHeaders: {
    "content-type": "application/json",
    "x-hasura-admin-secret":
    "WMObfEuC3Wto1JfFS9jZHBQspfyasE5fqFy2T5FY5qgjaj3KYIkmYSu8Ih6KvC2b"
  });



  static Link link = httpLink;

  static ValueNotifier<GraphQLClient> client =
  ValueNotifier(GraphQLClient(link: link, cache: GraphQLCache()));
}