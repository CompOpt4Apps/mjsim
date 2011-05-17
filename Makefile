########################################################################
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
# Ryan Moore February 2011 -- Added build system to package multiple jars
#   together to run without requiring to un-jar and then re-jar everything 
#   togther.
#########################################################################

# We need classes from the JavaCUP runtime library.
# This variable indicates where the java_cup/ subdirectory is located.
JAVA_CUP_RUNTIME = $(shell pwd)

.SUFFIXES: .java.class

#Sim variables
SIM_SRC_DIR=src
SIM_PARSE_DIR= $(SIM_SRC_DIR)/parse
BUILDDIR=build
SIMPROG = MJSIMLIB
SIMPROGFINAL = MJSIM

#-------------------------
JCC = javac
JAR = jar
#-------------------------


all: $(SIMPROG).jar jars
	mkdir $(BUILDDIR)/main/
	mv $(SIMPROG).jar $(BUILDDIR)/main/
	cd $(BUILDDIR) && jar -cvfm ../$(SIMPROGFINAL).jar boot-manifest.mf \
	*.class *.jar */*/*/*.class lib/*.jar main/*.jar

.PHONY:clean
clean:
	rm -f $(SIM_PARSE_DIR)/sym.java $(SIM_PARSE_DIR)/sim_inst.java $(SIM_PARSE_DIR)/Yylex.java
	rm -rf META_INF
	rm -rf $(SIMPROGFINAL).jar
	rm -rf $(SIM_SRC_DIR)/META-INF
	rm -rf $(SIM_SRC_DIR)/org
	rm -rf $(BUILDDIR)/lib
	rm -rf $(BUILDDIR)/main
	find $(SIM_SRC_DIR) -iname *.class -exec rm -rf {} \;

$(SIMPROG).jar: $(SIM_SRC_DIR)/ui/Main.class 
	cd $(SIM_SRC_DIR); $(JAR) cf $(SIMPROG).jar \
	log.conf */*.class */*/*.class */*/*/*.class */*/*/*.bxml */*/*/*.xml \
	*/*/*/*/*.xsd */*/*.bxml */*/*.png -C $(JAVA_CUP_RUNTIME) \
	java_cup 
	cd ..
	mv $(SIM_SRC_DIR)/$(SIMPROG).jar .

SIM_MAIN_DEPS = $(SIM_SRC_DIR)/ui/Main.java \
				$(SIM_PARSE_DIR)/Yylex.java $(SIM_PARSE_DIR)/sim_inst.java

jars:
	mkdir $(BUILDDIR)/lib
	cp $(SIM_SRC_DIR)/*.jar $(BUILDDIR)/lib/

$(SIM_SRC_DIR)/ui/Main.class: $(SIM_MAIN_DEPS)
	$(JCC) -classpath \
	$(JAVA_CUP_RUNTIME):$(SIM_SRC_DIR):$(SIM_SRC_DIR)/commons-cli-1.2.jar:$(SIM_SRC_DIR)/log4j-1.2.16.jar:$(SIM_SRC_DIR)/pivot-core-2.0.jar:$(SIM_SRC_DIR)/pivot-wtk-2.0.jar:$(SIM_SRC_DIR)/pivot-wtk-terra-2.0.jar \
	$(SIM_SRC_DIR)/ui/Main.java $(SIM_SRC_DIR)/ui/components/instructionViewer/InstructionViewer.java 

#### mj_ast parser
$(SIM_PARSE_DIR)/sim_inst.java: $(SIM_PARSE_DIR)/sim_inst.cup
	java -jar java-cup-11a.jar -parser sim_inst $(SIM_PARSE_DIR)/sim_inst.cup
	mv -f sym.java $(SIM_PARSE_DIR)/
	mv -f sim_inst.java $(SIM_PARSE_DIR)/

#### lexer, which can be shared amongst all three parsers
$(SIM_PARSE_DIR)/Yylex.java: $(SIM_PARSE_DIR)/sim.lex $(SIM_PARSE_DIR)/sim_inst.java 
	java -jar JLex.jar $(SIM_PARSE_DIR)/sim.lex
	mv $(SIM_PARSE_DIR)/sim.lex.java $(SIM_PARSE_DIR)/Yylex.java
