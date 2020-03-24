# Make HTTP Request in Flutter
> Add to dependencies =>   http: ^0.12.0+4
> Install it => flutter pub get
> Import it => import 'package:http/http.dart' as http;
>> To handle http request
>
> Import => `import 'dart:async/' `;
>> For async functions
>
> Import => `import 'dart:convert'`;
>> To convert the http response in JSON format


## Make your widget Stateful

## Create a Future with Async | Await

` class _HomePageState extends State<HomePage> {
    Future getData() async {
    http.Response response =  await http.get("myURLendpoint");
    debugPrint(response.body);
} `

## Update state

` @override
void initState() {
    super.initState();
    getData(); // => Calling the function
} `

## Map the JSON file -> then store the values in a List
` Map data;
  List userData; `

## Usage of variables and dart:convert inside Future getData()

` data = json.decode(response.body);
setState(() {
    userData = data["data"];
}); `

debugPrint(userData.toString()); `

## Finished! No you can use the data in a listview.builder and that's it!

`       body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      userData[index]["avatar"],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      10.0,
                    ),
                    child: Text(
                      "${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
`