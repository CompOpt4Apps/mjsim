#########################################################################
# Makefile for MJ
#
# The dependencies are not set up properly in this Makefile.  If you want
# to remake the jar file due to a change, then do a make clean first.
#
# To build the meggy jr binaries, issue a make meggy command.
# To upload the meggy jr binaries to the meggy jr handheld device
# issue a make upload command.
#
# Michelle Strout February 2009 -- Initial version
#########################################################################

# We need classes from the JavaCUP runtime library.
# This variable indicates where the java_cup/ subdirectory is located.
JAVA_CUP_RUNTIME = $(shell pwd)

.SUFFIXES: .java.class

#Sim variables
SIM_SRC_DIR=src
SIM_PARSE_DIR= $(SIM_SRC_DIR)/parse
SIMPROG = MJSIM

#-------------------------
JCC = javac
JAR = jar
#-------------------------


all: $(SIMPROG).jar

.PHONY:clean
clean:
	rm -rf $(SIM_SRC_DIR)/*.class $(SIM_SRC_DIR)/*/*.class $(SIM_SRC_DIR)/*/*/*.class
	rm -f $(SIM_PARSE_DIR)/sym.java $(SIM_PARSE_DIR)/sim_inst.java $(SIM_PARSE_DIR)/Yylex.java
	rm -rf META_INF
	rm -rf $(SIMPROG).jar
	rm -rf $(SIM_SRC_DIR)/META-INF
	rm -rf $(SIM_SRC_DIR)/org

$(SIMPROG).jar: $(SIM_SRC_DIR)/ui/Main.class jars
	cd $(SIM_SRC_DIR); $(JAR) cmf $(SIMPROG)MainClass.txt $(SIMPROG).jar *.jar \
	log.conf */*.class */*/*.class */*/*/*.class */*/*/*/*.class -C $(JAVA_CUP_RUNTIME) java_cup
	cd ..
	mv $(SIM_SRC_DIR)/$(SIMPROG).jar .

SIM_MAIN_DEPS = $(SIM_SRC_DIR)/ui/Main.java \
				$(SIM_PARSE_DIR)/Yylex.java $(SIM_PARSE_DIR)/sim_inst.java

jars:
	cd $(SIM_SRC_DIR) && jar xf commons-cli-1.2.jar;
	cd $(SIM_SRC_DIR) && jar xf log4j-1.2.16.jar;
	cd $(SIM_SRC_DIR) && jar xf pivot-core-2.0.jar;
	cd $(SIM_SRC_DIR) && jar xf pivot-wtk-2.0.jar;

$(SIM_SRC_DIR)/ui/Main.class: $(SIM_MAIN_DEPS)
	$(JCC) -classpath \
	$(JAVA_CUP_RUNTIME):$(SIM_SRC_DIR):$(SIM_SRC_DIR)/commons-cli-1.2.jar:$(SIM_SRC_DIR)/log4j-1.2.16.jar:$(SIM_SRC_DIR)/pivot-core-2.0.jar:$(SIM_SRC_DIR)/pivot-wtk-2.0.jar $(SIM_SRC_DIR)/ui/Main.java

#### mj_ast parser
$(SIM_PARSE_DIR)/sim_inst.java: $(SIM_PARSE_DIR)/sim_inst.cup
	java -jar java-cup-11a.jar -dump -parser sim_inst $(SIM_PARSE_DIR)/sim_inst.cup
	mv -f sym.java $(SIM_PARSE_DIR)/
	mv -f sim_inst.java $(SIM_PARSE_DIR)/

#### lexer, which can be shared amongst all three parsers
$(SIM_PARSE_DIR)/Yylex.java: $(SIM_PARSE_DIR)/sim.lex $(SIM_PARSE_DIR)/sim_inst.java 
	java -jar JLex.jar $(SIM_PARSE_DIR)/sim.lex
	mv $(SIM_PARSE_DIR)/sim.lex.java $(SIM_PARSE_DIR)/Yylex.java
