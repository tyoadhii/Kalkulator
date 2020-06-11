<%-- 
    Document   : index
    Created on : June 5, 2020, 6:27:52 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link href="./css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Calculator RSBK</title>
    </head>
    <body>
        <div class="bgo" id="home" style="background-color: #ffffff; height: 100%;">
            <div class="topnav" id="myTopnav">
                
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <div class="content">
                
                    <div class="column mainDisplay">
                        <div class="card" style="padding: 0;">
                            <div class="row" >
                                
                                <div class="column mainDisplay" id="calcPanel">
                                    <div class="card" style="padding: 0; background-color: #b3b3ff;">
                                        <form class="full" method="post" action="Tracker">
                                            <%
                                                String res;
                                                if(request.getSession().getAttribute("result")!=null) res = request.getSession().getAttribute("result").toString();
                                                else res="";
                                            %>
                                            <div id="mainScreen">
                                                <input class="equationScreen" type="text" id="equationValue" name="value" value="<% out.print(res); %>" readonly/>
                                                <input class="equationScreen" type="text" id="equationResult" name="result" value='<% out.print(res); %>' readonly/>
                                            </div>
                                            <div class="grid-container" style="height: 70%;">
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="deleteAllText()">C</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="deleteUp()">c</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="deleteText()">&#x25C1</button></div>  
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' / ')">/</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(1)">1</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(2)">2</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(3)">3</button></div>  
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' x ')">x</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(4)">4</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(5)">5</button></div>  
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(6)">6</button></div>
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' - ')">-</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(7)">7</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(8)">8</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(9)">9</button></div>
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' + ')">+</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(0)">0</button></div>
                                                <!--<div class="grid-item"><button type="button" class="clearButton" onclick="appendText(00)">00</button></div>-->
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="minused()">&#x2213</button></div> 
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText('.')">.</button></div>
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <input type="submit" value="=" class="clearButton accent accentButton"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                
                                
                                <!--<div class="column remainingDisplay" id="history">
                                    <h3 style="margin: 0; margin-bottom: 20px;">History</h3>
                                    <div id="historyPanel">
                                        <%
                                            String[] historyResult = (String[])request.getSession().getAttribute("historyResult");
                                            String[] historyEquation = (String[])request.getSession().getAttribute("historyEquation");
                                            int length;
                                            if(historyResult == null) {
                                                out.print("");
                                            }
                                            else {
                                                    length = historyResult.length;
                                                    for (int i = 1; i <= length; ++i) {
                                                        out.print("<div class='historyItem' onclick='appendText(");
                                                        out.print(historyResult[length - i]);
                                                        out.print(")'>\n<p style='margin: 0; cursor: default;'>\n");
                                                        out.print(historyEquation[length - i]);
                                                        out.print("</p><br/>\n<p style='font-size: 20px; margin: 0; cursor: default;'>");
                                                        out.print(historyResult[length - i]);
                                                        out.print("</p>\n</div>\n");
                                                    }
                                                }
                                        %>
                                    </div>
                                </div> -->
                                
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function myFunction() {
                var x = document.getElementById("myTopnav");
                if (x.className === "topnav") {
                    x.className += " responsive";
                } else {
                    x.className = "topnav";
                }
            }

            function appendText(x) {
                var eq = document.getElementById("equationValue").value.toString();
                if(eq === ""){
                    if(x === ' － ' || x === ' ＋ ' || x === ' × ' || x === ' ÷ '){
                        //do nothing
                    } else document.getElementById("equationValue").value += x;
                } else document.getElementById("equationValue").value += x;
            }

            function deleteText() {
                var str = document.getElementById("equationValue").value.toString();
                if(str.charAt(str.length - 1)===" " || str.charAt(str.length - 1)==="s") document.getElementById("equationValue").value = str.slice(0, -3);
                else document.getElementById("equationValue").value = str.slice(0, -1);
            }

            function deleteAllText() {
                document.getElementById("equationResult").value = "";
                document.getElementById("equationValue").value = "";
            }
            
            function deleteUp() {
                document.getElementById("equationValue").value = "";
                
            }
            
            function minused(){
                var target = document.getElementById("equationValue").value.toString();
                if(target.charAt(target.length -1) === "-"){
                    deleteText();
                } else {
                    appendText("-");
                }
            }

            function etc() {
                alert("not implemented yet");
            }
        </script>
    </body>
</html> 
