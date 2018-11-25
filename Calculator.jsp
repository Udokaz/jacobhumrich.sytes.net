<%@page import="java.util.Stack"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/jhumrich.css" type="text/css">
		<title>Calculator</title>
        <%
            String testing = (String) session.getAttribute("sessionVar1");
            if(testing == null)
                testing = "";
            String result = (String) session.getAttribute("result");
        %>
        <script>
            var inputStack = [];
            function displayInTextarea(type){
                inputStack.push(type);
                var text = "";
                for(var i = 0; i < inputStack.length; i++){
                    text += inputStack[i];
                }
                document.getElementById("input").value = "";
                document.getElementById("input").value += text;                
            }
            
            function deleteLast(){
                var textStack = [];
                var testInput = document.getElementById("input").value;
                textStack = testInput.split("");
                textStack.pop();
                document.getElementById("input").value = "";
                for( var i = 0; i < textStack.length; i++){
                    document.getElementById("input").value += textStack[i];
                }
                inputStack.pop();
            }
            
            function checkInput(element){
                var text = element.value;
                var reg = new RegExp("/^\d+$/");
                if(text.test(reg)){
                    document.getElementById("Warning").innerHTML = "Numbers only";
                }
            }
            
            function checkIfFirstChar(type){
                var textInput = document.getElementById("input").value;
                var test = "<%= result %>";
                if(textInput == ""){
                    if(test != ""){
                        document.getElementById("input").value = "";
                        var text = test + type;
                        displayInTextarea(text);
                    }
                }else {
                    displayInTextarea(type);
                }
            }
            
        </script>
               
        <title>Calculator</title>
    </head>
    <body><div><%@ include file="header.html" %></div>
        <div class="container">
            <h1>A Simple Calculator</h1>
            <p>This calculator is built using a form that sends the data to a servlet controller. The controller then sends the data to a model where it is processed and sent back.</p>
            <p>The servelt and model are both built in java. Some of the code is posted below the calculator.</p>
            <div class="grid-container">
                <div id="calculator">
					<textarea id="history" row="10" readonly><%= testing %></textarea>
                    <form action="Calculator" method="POST">
                        <div>
                        <input type="text" name="input" id="input" class="input" onclick="checkInput(this)">
                        <p id="Warning"></p>
                        </div>
                        <div>
                            <input type="button" name="add" value="+" class="inputButtons" onclick="checkIfFirstChar('+')">
                            <input type="button" name="subtract" value="-" class="inputButtons" onclick="checkIfFirstChar('-')">
                            <input type="button" name="multiply" value="*" class="inputButtons" onclick="checkIfFirstChar('*')">
                            <input type="button" name="divide" value="/" class="inputButtons" onclick="checkIfFirstChar('/')">
                        </div>
                        <div>
                            <input type="button" name="one" value="1" class="inputButtons" onclick="displayInTextarea('1')">
                            <input type="button" name="two" value="2" class="inputButtons" onclick="displayInTextarea('2')">
                            <input type="button" name="three" value="3" class="inputButtons" onclick="displayInTextarea('3')">
                            <input type="button" name="delete" value="DEL" class="inputButtons" onclick="deleteLast()">
                        </div>
                        <div>
                            <input type="button" name="four" value="4" class="inputButtons" onclick="displayInTextarea('4')">
                            <input type="button" name="five" value="5" class="inputButtons" onclick="displayInTextarea('5')">
                            <input type="button" name="six" value="6" class="inputButtons" onclick="displayInTextarea('6')">
							<input type="button" name="pi" value="&#120587" class="inputButtons" onclick="displayInTextarea('3.141592')"> 
                        </div>
                        <div>
                            <input type="button" name="seven" value="7" class="inputButtons" onclick="displayInTextarea('7')">
                            <input type="button" name="eight" value="8" class="inputButtons" onclick="displayInTextarea('8')">
                            <input type="button" name="nine" value="9" class="inputButtons" onclick="displayInTextarea('9')">
							<input type="button" name="e" value="e" class="inputButtons" onclick="displayInTextarea('2.718282')"> 

                        </div>
                        <input type="button" name="dot" value="." class="inputButtons" onclick="displayInTextarea('.')">
                        <input type="button" name="zero" value="0" class="inputButtons" onclick="displayInTextarea('0')">
                        <input type="submit" name="equals" value="=" class="inputButtons" onclick="checkInput(this)">
                        <input type="submit" name="clear" value="CLR" class="inputButtons" onclick="clearHistory()">

                    </form>
                </div>
                <p>The code below is a recursive function to parse out the input and then do the math.</p>
                <pre>
                    public float parseUserInput(String userInput){
                    String inputs[];
                    float total = 0;
                    if(userInput == null){
                        System.out.println("Parse error");
                    }
                    else if(userInput.contains("+")){
                        inputs = userInput.split("\\+");
                        for(int i = 0; i < inputs.length; i++){
                            if(i == 0 && inputs[0] == "" && inputs[1] != "")
                                total = result + parseUserInput(inputs[i]);
                            else
                                total += parseUserInput(inputs[i]);
                        }
                    }
                    else if(userInput.contains("-")){
                        inputs = userInput.split("-");
                        for(int i = 0; i < inputs.length; i++){
                            if(i == 0)
                                total = parseUserInput(inputs[i]);
                            else
                                total -= parseUserInput(inputs[i]);
                        }
                    }
                    else if(userInput.contains("*")){
                        inputs = userInput.split("\\*");
                        for(int i = 0; i < inputs.length; i++){
                            if(i == 0)
                                total = parseUserInput(inputs[i]);
                            else
                                total *= parseUserInput(inputs[i]);
                        }
                    }
                    else if(userInput.contains("/")){
                        inputs = userInput.split("/");
                        for(int i = 0; i < inputs.length; i++){
                            if(i == 0)
                                total = parseUserInput(inputs[i]);
                            else
                                total /= parseUserInput(inputs[i]);
                        }
                    }else
                        total = Float.parseFloat(userInput);
                    result = total;
                    return total;
                }
                </pre>
            </div>
        </div>
    </body>
</html>
