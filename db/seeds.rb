require_relative("../models/author.rb")
require_relative("../models/publisher.rb")
require_relative("../models/book.rb")
require("pry")

Book.delete_all()
Author.delete_all()
Publisher.delete_all()

author1 = Author.new({"name" => "Chris Pine"})
author1.save()

author2 = Author.new({"name" => "Leo tolsToy"})
author2.save()

author3 = Author.new({"name" => "Philip Pullman"})
author3.save()

author4 = Author.new({"name" => "J.R.R Tolkein"})
author4.save()

author5 = Author.new({"name" => "J.K.Rowling"})
author5.save()

publisher1 = Publisher.new({"name" => "ruby AAA"})
publisher1.save()

publisher2 = Publisher.new({"name" => "The Russia Messenger"})
publisher2.save()

publisher3 = Publisher.new({"name" => "Scholastic Corporation"})
publisher3.save()

publisher4 = Publisher.new({"name" => "Allen & unwin"})
publisher4.save()

publisher5 = Publisher.new({"name" => "Bloomsburry"})
publisher5.save()

book1 = Book.new({
        "title" => "Learn To program",
        "buying_price" => 11,
        "selling_price" => 15,
        "Description" => "The Facets of Ruby series",
        "stock_quantity" => 80,
        "author_id" => author1.id,
        "publisher_id" => publisher1.id
  })

book1.save()

book2 = Book.new({
          "title" => "War and peace",
          "buying_price" => 15,
          "selling_price" => 20,
          "Description" => "PPPPPP",
          "stock_quantity" => "90",
          "author_id" => author2.id,
          "publisher_id" => publisher2.id
    })

book2.save()

book3 = Book.new({
            "title" => "His Dark Materials",
            "buying_price" => 30,
            "selling_price" => 35,
            "Description" => "WWWWW",
            "stock_quantity" => 50,
            "author_id" => author3.id,
            "publisher_id" => publisher3.id
      })

book3.save()

book4 = Book.new({
              "title" => "Lords of Rings",
              "buying_price" =>20,
              "selling_price" =>25,
              "Description" =>"BBBB",
              "stock_quantity" =>80,
              "author_id" => author4.id,
              "publisher_id" => publisher4.id
        })

book4.save()

book5 = Book.new({
                "title" => "Harry Potter",
                "buying_price" =>10,
                "selling_price" =>12,
                "Description" =>"AAAAAAAAA",
                "stock_quantity" =>100,
                "author_id" => author5.id,
                "publisher_id" => publisher5.id
          })

book5.save()


binding.pry
nil
