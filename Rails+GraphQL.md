## 1. What is GraphQL

In this assignment we will ask you to create the Ruby on Rails application that uses GraphQL.
GraphQL was invented by FaceBook as an alternative function for RESTful  function. 
By using this function, you can call a resource (index (all) data of blogs, etc.) by a method different from the routing of resources.

When comparing RESTful and GraphQL, there are the following differences.

|        | RESTful    |graphQL    |
| :------------- | :----------: | -----------: |
| Required URL | Many   | Basically only one​ ​    |
| Number of calls   | A lot | Less | 
| Conditional expression  | The query|
| HTTP Method  | Get, Post, Put, Delete  | Post only   \| 



In other words, GraphQL is an excellent resource invocation method that can reduce unnecessary requests compared to RESTful.
(However, there are drawbacks that N + 1 problems are likely to occur and the description is more complicated than RESTful)
　
In GraphQL, as a general rules, data is acquired and updated basically by POST. 
Specify the processing to be performed for API by generating a query in the request parameter of POST.
One of the advantages of GraphQL is that the configuration allows you to implement the backend regardless of the configuration on the front side and page transition.


## 2. Implementation of GraphQL API (if using Rails 6)

In this assignment, you will create an app to experience GraphQL queries (requests) and experience what kind of request is sent and data is acquired.
　
This time around, the main focus is to let people experience options other than REST and experience new tools. Therefore, detailed explanation of the functions is omitted. If you find any points that are of concern outside the curriculum, check the official reference URL listed at the bottom.


https://github.com/rmosolgo/graphql-ruby
https://github.com/rmosolgo/graphiql-rails
　


The above URLs are a GraphQL gem that can be used in combination with Rails graphqland a gem of a tool that can check the operation by operating GraphQL API in a browser graphiql-rails.​

If you run bundle install these gems, set proper routing, and then run rails s (rails s -b 0.0.0.0 in vagrant environment) to access http://localhost:3000/graphiql, the following screen will be output.
* Please refer to README.md of graphiql-rails for proper routing

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/2438bd7c24cabc698aa090c0e76b8715.png)](https://diveintocode.gyazo.com/2438bd7c24cabc698aa090c0e76b8715)


**caution**
The curriculum is graphql 1.12 When graphiql-rails 1.7 We are proceeding on the premise of the version of. If the version is changed, the curriculum description may not work. In that case, please install by specifying the version as follows.
```
gem 'graphql', '~>1.12'
gem 'graphiql-rails', '~>1.7'
```

After that, if you type the following command on the console, a file group like the image below will be created.

```
$ rails generate graphql:install
$ rails g graphql:object Blog
```

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/526dc3f172946156a5bf9f3f7cb.png)]
(https://diveintocode.gyazo.com/526dc3f172946156a5bf9f3f7cb)

These files are the files to set the resource calling method in GraphQL.
First, field of the file app/graphql/types/blog_type.rb which data (column) to access.

Then in order to get the data, associate it with the query defined in app/graphql/types/query_type.rb .

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/069fc8682eec1c75db1cd9d38608b608.png)](https://diveintocode.gyazo.com/069fc8682eec1c75db1cd9d38608b608)

By context[:xxxxxx] part, the symbol and the acquired data can be linked.

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/542fac01ccfe96bdcc992386d3e7babe.png)](https://diveintocode.gyazo.com/542fac01ccfe96bdcc992386d3e7babe)

As seen in the image above, in app/controllers/graphql_controller.rbwe will make a description that links the data you want to get in the :blogpart​.
This completes one GraphQL API.

Please skip the following "Implementation of GraphQL API (if you are using Rails 5)" and check the item of "Launching GraphQL API".

## 3. Implementation of GraphQL API (if using Rails 5)

In this assignment, you will create an app to experience GraphQL queries (requests) and experience what kind of request is sent and data is acquired.
　


This time around, the main focus is to let people experience options other than REST and experience new tools. Therefore, detailed explanation of the functions is omitted. If you find any points that are of concern outside the curriculum, check the official reference URL listed at the bottom.


https://github.com/rmosolgo/graphql-ruby
https://github.com/rmosolgo/graphiql-rails
　


The above URLs are a GraphQL gem that can be used in combination with Rails graphqland a gem of a tool that can check the operation by operating GraphQL API in a browser graphiql-rails.​


If you run bundle install these gems, set proper routing, and then run rails s (rails s -b 0.0.0.0 in vagrant environment) to access http://localhost:3000/graphiql, the following screen will be output.
* Please refer to README.md of graphiql-rails for proper routing

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/2438bd7c24cabc698aa090c0e76b8715.png)](https://diveintocode.gyazo.com/2438bd7c24cabc698aa090c0e76b8715)


**Note**
Curriculum graphql 1.7 is based on the version of graphiql-rails 1.5 We are proceeding with this version. If the version changes, the curriculum description may not work. In that case, please specify the version as shown below and install it.

```
gem 'graphql', '<= 1.7'
gem 'graphiql-rails', '<= 1.5'
```

After that, if you type the following command on the console, a file group like the image below will be created.
```
$ rails generate graphql:install
# The description after Blog uses the columns and data types of that model.
# Available types are Int, Float, String, Boolean, ID, etc.
$ rails g graphql:object Blog id:ID! title:String! text:String!
```
[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/ca26d9b2e359b9cac5293cee6af5809f.png)](https://diveintocode.gyazo.com/ca26d9b2e359b9cac5293cee6af5809f)


These files are the files to set the resource calling method in GraphQL.
Theapp/graphql/types/blog_type.rb file's name is used in the schema definition settings, and defines the field to access data (column).
Then in order to get the data, associate it with the query defined in app/graphql/types/query_type.rb .

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/306edbfd197f08d6d0db571f2428b89d.png)](https://diveintocode.gyazo.com/306edbfd197f08d6d0db571f2428b89d)

By describe the symbol in the part of ctx [: xxxxxx], you can link the acquired data with the symbol.

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/bae9f7053deb8dfa8cf6a23e57d60e86.png)](https://diveintocode.gyazo.com/bae9f7053deb8dfa8cf6a23e57d60e86)


As seen in the image above, in app/controllers/graphql_controller.rbwe will make a description that links the data you want to get in the :blogpart​.
This completes one GraphQL API.


**4. Launch GraphQL API**

In this state, try to query in the confirmation browser http://localhost:3000/graphiql .

[![Image from Gyazo](https://t.gyazo.com/teams/diveintocode/f26d28acc74b38fbfd8766a048da7b02.png)](https://diveintocode.gyazo.com/f26d28acc74b38fbfd8766a048da7b02)

in this way,

```
{ 
 blog { 
 id 
 title 
 text 
 } 
 }
```
By throwing a query of the form you can get the contents of id column, title column and text column of the data obtained from​ by sending a query of the form blog: Blog.last​


**5. GraphQL API reference**

If you would like to know more about GraphQL, please read the official reference below.
In practice, you will also experience implementing it while looking at the official reference.


http://graphql-ruby.org/


https://graphql.org/learn/


http://graphql-ruby.org/guides


**6. assignment**

Now, create a Ruby on Rails application that meets the following conditions. It should be noted that, "the last Web Technology Practice Series Assignment 1 [Build the application of Ruby on Rails using Nginx] of" assignment, please use a different app and Blog application that was created in. You may create a new one using scaffold.

```
- Add the graphql and graphiql-rails gems to the app that has the blog feature.
- When you access http://localhost:3000/graphiql, a screen like the one shown in the sample should appear, and when you enter a query on the screen, the first data of the blog registered in the DB should be output.
- Take a screenshot of the screen when the data is output and post it in the comments section of the assignment.
```


Submission method
Please submit from the following URL.


https://diver.diveintocode.jp/submissions/new/?exercise_id=143

