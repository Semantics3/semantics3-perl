# semantics3-perl

Net::Semantics3 is a Perl client for accessing the Semantics3 Products API, which provides structured information, including pricing histories, for a large number of products.
See https://www.semantics3.com for more information.

API documentation can be found at https://www.semantics3.com/docs/

## Installation

Net::Semantics3 can be installed through the CPAN:
```
$ perl -MCPAN -e "install Net::Semantics3"
```
To build and install from the latest source:
```
$ git clone git@github.com:Semantics3/semantics3-perl.git
$ cd semantics3-perl
$ perl Makefile.PL
$ make
$ make test
$ make install
```

## Requirements

* LWP::UserAgent
* OAuth::Lite::Consumer
* JSON::XS

## Getting Started

In order to use the client, you must have both an API key and an API secret. To obtain your key and secret, you need to first create an account at
https://www.semantics3.com/
You can access your API access credentials from the user dashboard at https://www.semantics3.com/dashboard/applications

### Setup Work

Let's lay the groundwork.

```perl
use Net::Semantics3::Products;

# Your Semantics3 API Credentials
my $api_key = "SEM3xxxxxxxxxxxxxxxxxxxxxx";
my $api_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

# Set up a client to talk to the Semantics3 API
my $sem3 = Net::Semantics3::Products->new (
  api_key => $api_key,
  api_secret => $api_secret,
);
```

### First Query aka 'Hello World':

Let's make our first query! We are going to run a simple search fo the word "iPhone" as follows:

```perl
# Build the query
$sem3->products_field( "search", "iphone" );

# Make the query
my $productsRef = $sem3->get_products();

# View the results of the query
print STDERR Dumper( $productsRef );
```

## Sample Queries

The following queries show you how to interface with some of the core functionality of the Semantics3 Products API:

### Pagination

The example in our "Hello World" script returns the first 10 results. In this example, we'll scroll to subsequent pages, beyond our initial query:

```perl
# Build the query
$sem3->products_field( "search", "iphone" );

# Make the query
my $productsRef = $sem3->get_products();

# View the results of the query
print STDERR Dumper( $productsRef );

# Goto the next 'page'
my $page = 0;
while(my $productsRef = $sem3->iterate_products()) {
    $page++;
    print STDERR "We are at page = $page\n";
    print STDERR "The results for this page are:\n";
    print STDERR Dumper( $productsRef );
}
```

### UPC Query

Running a UPC/EAN/GTIN query is as simple as running a search query:

```perl
# Build the query
$sem3->products_field( "upc", "883974958450" );
$sem3->products_field( "field", ["name","gtins"] );

# Make the query
my $productsRef = $sem3->get_products();

# View the results of the query
print STDERR Dumper( $productsRef );
```

### URL Query

Get the picture? You can run URL queries as follows:

```perl
$sem3->products_field( "url", "http://www.walmart.com/ip/15833173" );
my $productsRef = $sem3->get_products();
print STDERR Dumper( $productsRef );
```

### Price Filter

Filter by price using the "lt" (less than) tag:

```perl
$sem3->products_field( "search", "iphone" );
$sem3->products_field( "price", "lt", 300 );
my $productsRef = $sem3->get_products();
print STDERR Dumper( $productsRef );
```

### Category ID Query

To lookup details about a cat_id, run your request against the categories resource:

```perl
# Build the query
$sem3->categories_field( "cat_id", 4992 );

# Make the query
my $categoriesRef = $sem3->get_categories();

# View the results of the query
print STDERR Dumper( $categoriesRef );
```


## Contributing

Use GitHub's standard fork/commit/pull-request cycle.  If you have any questions, email <support@semantics3.com>.

## Author

* Sivamani VARUN <varun@semantics3.com>

## Copyright

Copyright (c) 2015 Semantics3 Inc.

## License

    The "MIT" License
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.


