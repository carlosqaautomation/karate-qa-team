function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    urlBase: 'https://reqres.in/'
  }

  if (env == 'dev') {
    // customize
    url: "https://dev.qa-team.com"
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
    url: "https://e2e.qa-team.com"
  }
  return config;
}