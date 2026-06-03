package team;
import robocode.*;
import java.awt.Color; // Ativa as cores do time

// API help : https://robocode.sourceforge.io/docs/robocode/robocode/Robot.html

/**
 * DreamTeamTwo - O Suporte Evasivo do time
 */
public class DreamTeamTwo extends Robot
{
	/**
	 * run: DreamTeamTwo's default behavior
	 */
	public void run() {
		// Cores invertidas do DreamTeam (Amarelo predominante com detalhes em preto)
		setColors(Color.yellow, Color.black, Color.yellow); 

		// Robot main loop
		while(true) {
			// Movimentação em padrão diagonal/triangular para confundir os inimigos
			ahead(120);
			turnGunRight(360);
			turnLeft(45);
			back(120);
			turnGunRight(360);
			turnRight(45);
		}
	}

	/**
	 * onScannedRobot: O que fazer quando vê outro robô
	 */
	public void onScannedRobot(ScannedRobotEvent e) {
		// --- PROTEÇÃO CONTRA FOGO AMIGO ---
		// Se for o parceiro DreamTeamOne, ignora e não atira
		if (e.getName().contains("DreamTeamOne")) {
			return;
		}

		// --- ESTRATÉGIA DE TIRO DE SUPORTE ---
		// Atira de forma constante e econômica para conservar vida até o fim da rodada
		if (e.getDistance() < 150) {
			fire(2.5); // Fogo rápido de perto
		} else {
			fire(1.0); // Tiro leve de longe para importunar o alvo
		}
	}

	/**
	 * onHitByBullet: O que fazer quando leva um tiro
	 */
	public void onHitByBullet(HitByBulletEvent e) {
		// Movimento de fuga em ziguezague para quebrar rastreadores inimigos
		turnLeft(60);
		ahead(60);
	}
	
	/**
	 * onHitWall: O que fazer quando bate na parede
	 */
	public void onHitWall(HitWallEvent e) {
		// Afasta-se rapidamente e rotaciona para o centro da arena
		back(40);
		turnRight(120);
	}	
}