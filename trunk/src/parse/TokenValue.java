package parse;

/* semantic value of token returned by scanner */
public class TokenValue {          
  public int line;
  public int pos;
  public String text;  

  public TokenValue() {
  }

  public TokenValue(String text, int line, int pos) {
    this.text = text; 
    this.line = line; 
    this.pos = pos;
  }

  public String toString() { 
    return text;
  }
}
