#include "MyTools.h"

#include <iostream>

void MyListener::enterValue(demoParser::ValueContext *ctx) {
  if (ctx->INT())
    std::cout << "Listener found an int: " << ctx->INT()->getText() << '\n';
  else if (ctx->STR())
    std::cout << "Listener found a string: " << ctx->STR()->getText() << '\n';
  else
    std::cout << "Listener found an unknown token?!\n";
}

antlrcpp::Any MyVisitor::visitValue(demoParser::ValueContext *ctx) {
  if (ctx->INT())
    std::cout << "Visitor found an int: " << ctx->INT()->getText() << '\n';
  else if (ctx->STR())
    std::cout << "Visitor found a string: " << ctx->STR()->getText() << '\n';
  else
    std::cout << "Visitor found an unknown token?!\n";

  return nullptr;
}
