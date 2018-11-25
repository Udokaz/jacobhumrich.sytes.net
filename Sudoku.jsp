<%-- 
    Document   : Sudoku
    Created on : Aug 10, 2018, 2:37:43 PM
    Author     : IT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/jhumrich.css" type="text/css">
        <title>Sudoku</title>
    </head>
    <script text="type/javascript">
        
        class Sudoku{
            constructor(solution, shown){
                this.solution = solution;
                this.shown = shown;
            }
            
            getSolution(){
                return this.solution;
            }
            
            getShown(){
                return this.shown;
            }
        }
        
        var solution1 = [
            8,2,7,1,5,4,3,9,6,
            9,6,5,3,2,7,1,4,8,
            3,4,1,6,8,9,7,5,2,
            5,9,3,4,6,8,2,7,1,
            4,7,2,5,1,3,6,8,9,
            6,1,8,9,7,2,4,3,5,
            7,8,6,2,3,5,9,1,4,
            1,5,4,7,9,6,8,2,3,
            2,3,9,8,4,1,5,6,7
            ];
        var shown1 = [
            "",2,"","","",4,3,"","",
            9,"","","",2,"","","",8,
            "","","",6,"",9,"",5,"",
            "","","","","","","","",1,
            "",7,2,5,"",3,6,8,"",
            6,"","","","","","","","",
            "",8,"",2,"",5,"","","",
            1,"","","",9,"","","",3,
            "","",9,8,"","","",6,""
            ];
        
        var solution2 = [
            3,9,6,4,1,5,2,7,8,
            1,2,5,7,3,8,4,6,9,
            4,7,8,2,6,9,3,1,5,
            7,5,9,6,4,2,8,3,1,
            8,4,3,5,9,1,7,2,6,
            2,6,1,3,8,7,5,9,4,
            5,3,4,9,2,6,1,8,7,
            6,8,7,1,5,3,9,4,2,
            9,1,2,8,7,4,6,5,3
            ];
        var shown2 = [
            3,"","","","","","","","",
            "","","","",3,8,"","",9,
            "",7,"",2,6,"","","",5,
            "",5,"","","","","",3,1,
            8,"",3,"",9,"",7,"",6,
            2,6,"","","","","",9,"",
            5,"","","",2,6,"",8,"",
            6,"","",1,5,"","","","",
            "","","","","","","","",3
            ];
            
        var solution3 = [
            7,4,1,9,8,6,2,3,5,
            6,5,2,7,3,1,9,8,4,
            9,8,3,5,2,4,6,1,7,
            5,9,8,1,4,2,7,6,3,
            3,7,4,6,9,5,8,2,1,
            1,2,6,3,7,8,4,5,9,
            8,3,7,2,5,9,1,4,6,
            4,1,5,8,6,7,3,9,2,
            2,6,9,4,1,3,5,7,8
            ];
        var shown3 = [
            "","",1,"","","","","","",
            "","",2,"",3,"","","",4,
            "","","",5,"","",6,"",7,
            5,"","",1,4,"","","","",
            "",7,"","","","","",2,"",
            "","","","",7,8,"","",9,
            8,"",7,"","",9,"","","",
            4,"","","",6,"",3,"","",
            "","","","","","",5,"",""
            ];
        var s1;
        
        
        
        function createSelect(row, col){
            var select = document.createElement("select");
            
            var setUp = s1.getShown();
            var check = (row * 10 + col) - row;
            var selectID = "select" + check;
            select.setAttribute("id", selectID);
            for(var i = 0; i < 10; i++){
                var option = document.createElement("option");
                if(i === 0){
                    option.text = " ";
                }
                else{
                    option.text = i;
                }
                if(setUp[check] === i){
                    option.selected = true;
                }
                    
                select.appendChild(option);
            }
            return select;
        }
        
        function setUpTable(){
            var table = document.getElementById("sudokuTable");
            for(var i = 0; i < 9; i++){
                var tr = document.createElement("tr");
                for(var j = 0; j < 9; j++){
                    var td = document.createElement("td");
                    td.setAttribute("id", i + "+" + j);
                    td.appendChild(createSelect(i, j));
                    tr.appendChild(td);
                }
                table.appendChild(tr);
                
            }
            table.setAttribute("border", "2");
        }
        
        function sudokuFactory(){
            var randomPick = Math.floor(Math.random() * 5);
            sudokuFill(randomPick);            
        }
        
        function sudokuFill(picked){
            if(picked === 1)
                s1 = new Sudoku(solution1, shown1);
            else if(picked === 2)
                s1 = new Sudoku(solution2, shown2);
            else if(picked === 3)
                s1 = new Sudoku(solution3, shown3);
            else if(picked === 4)
                s1 = new Sudoku(solution1, shown1);
            else
                s1 = new Sudoku(solution1, shown1);
            
            setUpTable();
        }
        
        function checkIfSolved(){
            var solvedArray = s1.getSolution();
            for(var i = 0; i < 81; i++){
                var selector = "select" + i;
                var select = document.getElementById(selector);
                var selectValue = select.options[select.selectedIndex].value;
                console.log("selectValue: " + selectValue + " solvedArray: " + solvedArray[i]);
                if(selectValue != solvedArray[i])
                    return false;
            }
            return true;
        }
        
        function solved(){
            var result = document.getElementById("results");
            if(checkIfSolved() === true){
                
                result.innerHTML = "You solved it!";
                console.log("Solved");
            }else{
                result.innerHTML = "Not quite there!";
                console.log("Not solved");
            }
        }
        
        window.onload = sudokuFactory;
        
    </script>
    <body>
        <div><%@ include file="header.html" %></div>
        <div class="container">
            <h2>Sudoku</h2>
            <p>This is a Sudoku game that is build all in Javascript. It only has 3 different puzzles. It randomly picks one of the puzzles to display.</p>
            <p>You can check if it is the correct answer by pressing check. 
            <h2 id="results"></h2>
            <div>
                <table id="sudokuTable">
                    <%
                        
                        
                    %>
                </table>
              
            </div>
                <input type="button" value="Check" onclick="solved()">
        </div>
		<div><%@ include file="footer.html" %></div>
    </body>
</html>
