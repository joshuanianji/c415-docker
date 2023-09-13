#ifndef MY_TOOLS_H
#define MY_TOOLS_H

#include "demoBaseListener.h"
#include "demoBaseVisitor.h"

#include "support/Any.h"

class MyListener : public demoBaseListener {
public:
  void enterValue(demoParser::ValueContext *) override;
};

class MyVisitor : public demoBaseVisitor {
public:
  antlrcpp::Any visitValue(demoParser::ValueContext *ctx) override;
};

#endif
