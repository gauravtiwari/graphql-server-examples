<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

  <title>Laravel Graphql</title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/react/15.1.0/react.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/react/15.1.0/react-dom.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fetch/1.0.0/fetch.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/graphiql/0.7.1/graphiql.min.js"></script>
  <!--[if lt IE 7]>
    <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.2/CFInstall.min.js"></script>
    <script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})})</script>
  <![endif]-->

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/graphiql/0.7.1/graphiql.min.css" />
  <style type="text/css">
    html, body {
      height: 100%;
      margin: 0;
      overflow: hidden;
      width: 100%;
    }

  </style>
</head>
<body>
  <div id="graphiql-container">
    Loading...
  </div>
  <script>
    var parameters = {};
    // Parse the search string to get url parameters.
    var search = window.location.search;
    search.substr(1).split('&').forEach(function (entry) {
     var eq = entry.indexOf('=');
     if (eq >= 0) {
       parameters[decodeURIComponent(entry.slice(0, eq))] =
         decodeURIComponent(entry.slice(eq + 1));
     }
    });
    // if variables was provided, try to format it.
    if (parameters.variables) {
     try {
       parameters.variables =
         JSON.stringify(JSON.parse(parameters.variables), null, 2);
     } catch (e) {
       // Do nothing, we want to display the invalid JSON as a string, rather
       // than present an error.
     }
    }
    // When the query and variables string is edited, update the URL bar so
    // that it can be easily shared
    function onEditQuery(newQuery) {
     parameters.query = newQuery;
     updateURL();
    }
    function onEditVariables(newVariables) {
     parameters.variables = newVariables;
     updateURL();
    }
    function updateURL() {
     var newSearch = '?' + Object.keys(parameters).map(function (key) {
       return encodeURIComponent(key) + '=' +
         encodeURIComponent(parameters[key]);
     }).join('&');
     history.replaceState(null, null, newSearch);
    }
    // Defines a GraphQL fetcher using the fetch API.
    function graphQLFetcher(graphQLParams) {
      return fetch('/graphql', {
        method: 'post',
        body: JSON.stringify(graphQLParams),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        credentials: 'include',
      }).then(function (response) {
        return response.json()
      });
    }
    // Render <GraphiQL /> into the body.
    ReactDOM.render(
      React.createElement(GraphiQL, {
        fetcher: graphQLFetcher,
        defaultQuery: "{}",
        query: parameters.query,
        variables: parameters.variables,
        onEditQuery: onEditQuery,
        onEditVariables: onEditVariables
      }),
      document.getElementById("graphiql-container")
    );
  </script>
</body>
