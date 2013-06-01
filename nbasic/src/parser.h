/*
 * Generated by the Waxeye Parser Generator - version 0.8.0
 * www.waxeye.org
 */

#ifndef PARSER_H_
#define PARSER_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <waxeye.h>

enum type {
    TYPE_PROGRAM,
    TYPE_STATEMENT,
    TYPE_ENDSTAT,
    TYPE_INPUTSTAT,
    TYPE_PRINTSTAT,
    TYPE_IFSTAT,
    TYPE_THENCLAUSE,
    TYPE_ELSECLAUSE,
    TYPE_WHILESTAT,
    TYPE_ASSIGNSTAT,
    TYPE_DOSTAT,
    TYPE_COND,
    TYPE_EXPRLIST,
    TYPE_EXPRESSION,
    TYPE_TERM,
    TYPE_FACTOR,
    TYPE_END,
    TYPE_PRINT,
    TYPE_INPUT,
    TYPE_IF,
    TYPE_THEN,
    TYPE_ELSE,
    TYPE_WHILE,
    TYPE_WEND,
    TYPE_LET,
    TYPE_DO,
    TYPE_ID,
    TYPE_NUM,
    TYPE_STRING,
    TYPE_COMMA,
    TYPE_LPAREN,
    TYPE_RPAREN,
    TYPE_ADDOP,
    TYPE_MULTOP,
    TYPE_RELOP,
    TYPE_ASSIGN,
    TYPE_ENDL,
    TYPE_WS
};

#ifndef PARSER_C_

extern const char *type_strings[];
extern struct parser_t* parser_new();

#endif /* PARSER_C_ */

#ifdef __cplusplus
}
#endif

#endif /* PARSER_H_ */
