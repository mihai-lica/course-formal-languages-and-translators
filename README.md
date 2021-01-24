# Formal Languages and Translators course presentation support

## Credit to: prof. Victor Patriciu, referenced books, articles, web pages, and other forgotten authors and materials.



# Syllabus

## Introduction to formal languages

1. Definition
2. Motivation
3. History
4. Programming paradigms

## Grammars

1. An intuitive approach to grammars
2. Definition
3. Kleene star. Kleene plus
4. Yielding/Derivation relation 
- Direct yielding/derivation relation
- Leftmost derivation
- Rightmost derivation
- K-steps yielding/derivation relation
- Transitive closure of the yielding/derivation relation
- Reflexive transitive closure of the yielding/derivation relation
5. Propositional form
6. Proposition
7. Language
8. Chomsky hierarchie. Grammar types
- General grammars
- Context-sensitive grammars
- Context-free grammars
- Regular grammars
9. Parsing trees
- Top-down parsing trees
- Bottom-up parsing trees
10. Parsing

## Regular languages

1. Regular grammars
2. Deterministic finite state automata
- Definition
- Configuration
- Movement relation 
- K-steps movement relation
- Transitive closure of the movement relation
- Reflexive transitive closure of the movement relation
- Proposition
- Language
3. Non-deterministic finite state automata
4. Epsilon finite state automata
5. Finite state automata versus regular grammars
6. Regular expressions
- Definiton
- Conventions
- From regular expressions to finite state automata
7. Regular expressions versus finite state automata versus regular grammars

## Proving regularity/non-regularity of languages

1. Pigeonhole principle
2. Pumping lemma for regular languages
3. Myhill-Nerode à la Brzozowski theorem
- language derivatives

## Context-free languages

1. Top-down parsing
- Predictive parsing
- Top-down parsing with backtracking
- Abstract predictive parsing machine
- LL(1) parsing
- Abstract LL(1) parsing machine
- Recursive descent parsing
2. Bottom-up parsing
- Shift-reduce parsing
- Bottom-up parsing with backtracking
- Precedence parsing
* Operator precedence parsing
* Simple precedence parsing
* Weak precedence parsing
- LR(1) parsing
* SLR(1) parsing
* LALR(1) parsing

## Translation theory

1. Definition of a translator/compiler
2. Translators/compilers classification
3. Translators/compilers design
4. Lexical analysis (lexing)
5. Syntactic analysis (parsing)
6. Semantic analysis
7. Intermediate code generation
8. Optimization
9. Code generation

## Flex & bison

1. Flex
2. Bison

