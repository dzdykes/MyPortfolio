package cis232.classlab.main;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;

public class RPSController {

	String p1choice = "", p2choice = "";
	
	int p1Score = 0, p2Score = 0;

	Image rock = new Image(getClass().getResourceAsStream("rock.png"));
	Image paper = new Image(getClass().getResourceAsStream("paper.png"));
	Image scissors = new Image(getClass().getResourceAsStream("scissors.png"));

//    @FXML
//    private ImageView p1Q;
//    
//    @FXML
//    private ImageView p2Q;
	
	@FXML
	private ImageView imagePlayer1;

	@FXML
	private ImageView imagePlayer2;

	@FXML
	private Button buttonNewGame;

	@FXML
	private Label labelWinner;
	
    @FXML
    private Label labelp2Score;
    
    @FXML
    private Label labelp1Score;

	@FXML
	void keyboardReleaseListener(KeyEvent event) {
		if (labelWinner.getText().isEmpty()) {
			String choice = event.getText();
			String winner = "";

			switch (choice) {
			case "a":
				imagePlayer1.setImage(rock);
				p1choice = "r";
				break;
			case "s":
				imagePlayer1.setImage(paper);
				p1choice = "p";
				;
				break;
			case "d":
				imagePlayer1.setImage(scissors);
				p1choice = "s";
				break;
			case "j":
				imagePlayer2.setImage(rock);
				p2choice = "r";
				break;
			case "k":
				imagePlayer2.setImage(paper);
				p2choice = "p";
				break;
			case "l":
				imagePlayer2.setImage(scissors);
				p2choice = "s";
				break;
			}

			if (!p1choice.isEmpty() && !p2choice.isEmpty()) {
//				p1Q.setVisible(false);
//				p2Q.setVisible(false);
				imagePlayer1.setVisible(true);
				imagePlayer2.setVisible(true);

				if (p1choice.equals("r")) {
					if (p2choice.equals("s")) {
						winner = "Player 1 Wins!";
						p1Score++;
					} else if (p2choice.equals("p")) {
						winner = "Player 2 Wins!";
						p2Score++;
					} else {
						winner = "Draw!";
					}
				}
				if (p1choice.equals("p")) {
					if (p2choice.equals("r")) {
						winner = "Player 1 Wins!";
						p1Score++;
					} else if (p2choice.equals("s")) {
						winner = "Player 2 Wins!";
						p2Score++;
					} else {
						winner = "Draw!";
					}
				}
				if (p1choice.equals("s")) {
					if (p2choice.equals("p")) {
						winner = "Player 1 Wins!";
						p1Score++;
					} else if (p2choice.equals("r")) {
						winner = "Player 2 Wins!";
						p2Score++;
					} else {
						winner = "Draw!";
					}
				}

				labelWinner.setText(winner);
				labelp1Score.setText("" + p1Score);
				labelp2Score.setText("" + p2Score);
			}
		}
	}

	@FXML
	void buttonNewGameListener(ActionEvent event) {
		imagePlayer1.setVisible(false);
		imagePlayer2.setVisible(false);
//		p1Q.setVisible(true);
//		p2Q.setVisible(true);
		p1choice = "";
		p2choice = "";
		labelWinner.setText("");
	}

}
