<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/jhumrich.css" type="text/css">
        <title>Fulfilment System</title>
    </head>
	<body>
        <div><%@ include file="header.html" %></div>
        <div class="container">
            <h2>Fulfillment System</h2>
            <p>
				This is a over view of a JavaFX program that I create with a group in my Software Engineering class. 
				The program allows either a watier or a customer to look in a menu. Find the food that they would want to order. Order the food and check on its progress. 
				The order will show the cost for each item and the total cost before and after tax. It allows the owner to add in different food items and their cost. 
				It uses a Database to keep control of the users and the food items. The kitchen has its own window to see orders. They are able to see how long the order has been there and complete the order.
			</p>
			<p>The git for the program is <a href="https://github.com/GammaTeamFall2017/Fulfillment-System">https://github.com/GammaTeamFall2017/Fulfillment-System</a></p>
			<pre>Some of the code that I worked on:
	   @Override
		public void initialize(URL location, ResourceBundle resources) {
			//can put top food items here
			//itemsArray = newDB.getAllItems();
			foodButtonPane.setStyle("-fx-box-border: transparent;");
			orderPane.setStyle("-fx-box-border: transparent; -fx-background-color: #e0e0e0");
			
			BigDecimal bd = new BigDecimal("1.5");
			//This is to temp fill a array of items
			
			for(int i = 0; i < 4; i++){
				Item tempItems = new Item(i, "food" + i, i+1, bd );
				itemsArray.add(tempItems);
			}
			
			//end of temp area
			
			int row = (itemsArray.size() / buttonsPerRow) + 1;//gets the total rows if there are 6 buttons in a row
			int col = buttonsPerRow;
			int end = itemsArray.size() % buttonsPerRow;//gets the total for the last row
			
			int counter = 0;
			for(int i = 0; i < row; i++){
				int buttonsWidth = 720 / buttonsPerRow; //720 is the size of the VBox
				HBox tempHBox = new HBox(buttonsWidth);
				tempHBox.setPrefWidth(buttonsWidth); 
				tempHBox.setPrefHeight(buttonHeight);
				if(i == (row - 1)){
				   col = end;
				}            
				for(int j = 0; j < col; j++) {
					Item tempItem = itemsArray.get(counter++);
					Pane newPane = new Pane();
					Button newButton = new Button(tempItem.getItemName());
					newButton.setOnAction(new EventHandler<ActionEvent>(){
						@Override public void handle(ActionEvent e){
						
							//add this scene in when it is created
							//newScene.setScene("/cs4310/fulfillment/program/View/.fxml", (Button)e.getSource());
						
						}
					});
					newButton.setMinWidth(tempHBox.getPrefWidth());
					newButton.setMinHeight(tempHBox.getPrefHeight());
					newPane.getChildren().add(newButton);
					tempHBox.getChildren().add(newPane);
					tempHBox.setFillHeight(true);
					
				}
				VBoxButtons.getChildren().add(tempHBox);
			}
		}
			</pre>
			
        </div>
		<br><br><br>
		<div><%@ include file="footer.html" %></div>
    </body>
</html>
