#include "MyTools.h"

#include "demoLexer.h"
#include "demoParser.h"

#include "ANTLRFileStream.h"
#include "CommonTokenStream.h"
#include "tree/ParseTree.h"
#include "tree/ParseTreeWalker.h"

#include <iostream>

int main(int argc, char **argv) {
  if (argc < 2) {
    std::cout << "Missing required argument.\n"
              << "Required arguments: <input file path>\n";
    return 1;
  }

  // Open the file then parse and lex it.
  antlr4::ANTLRFileStream afs;
  afs.loadFromFile(argv[1]);
  demoLexer lexer(&afs);
  antlr4::CommonTokenStream tokens(&lexer);
  demoParser parser(&tokens);

  // Get the root of the parse tree. Use your base rule name.
  antlr4::tree::ParseTree *tree = parser.file();

  // HOW TO USE A LISTENER
  // Make the listener
  MyListener listener;
  // Walk the tree
  antlr4::tree::ParseTreeWalker::DEFAULT.walk(&listener, tree);

  // HOW TO USE A VISITOR
  // Make the visitor
  MyVisitor visitor;
  // Visit the tree
  visitor.visit(tree);
}
