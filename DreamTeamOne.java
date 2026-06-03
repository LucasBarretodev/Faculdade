package team;
import robocode.*;
import java.awt.Color; // Descomentado para ativar as cores do time

// API help : https://robocode.sourceforge.io/docs/robocode/robocode/Robot.html

/**
 * DreamTeamOne - O Sniper do time
 */
public class DreamTeamOne extends Robot
{
	/**
	 * run: DreamTeamOne's default behavior
	 */
	public void run() {
		// Cores do DreamTeam (Preto com detalhes em amarelo/dourado)
		setColors(Color.black, Color.yellow, Color.black); 

		// Robot main loop
		while(true) {
			// Movimentação básica contínua enquanto procura alvos
			ahead(100);
			turnGunRight(360);
			back(100);
			turnGunRight(360);
		}
	}

	/**
	 * onScannedRobot: O que fazer quando vê outro robô
	 */
	public void onScannedRobot(ScannedRobotEvent e) {
		// --- PROTEÇÃO CONTRA FOGO AMIGO ---
		// Se for o parceiro DreamTeamTwo, ignora e não atira
		if (e.getName().contains("DreamTeamTwo")) {
			return;
		}

		// --- MIRA E TIRO INTELIGENTE ---
		// Trava a mira no inimigo e calcula a força do tiro pela distância
		if (e.getDistance() < 200) {
			fire(3.0); // Tiro pesado perto
		} else if (e.getDistance() < 500) {
			fire(1.5); // Tiro médio
		} else {
			fire(1.0); // Tiro leve longe
		}
	}

	/**
	 * onHitByBullet: O que fazer quando leva um tiro
	 */
	public void onHitByBullet(HitByBulletEvent e) {
		// Resposta evasiva rápida para sair da linha de fogo
		turnRight(90);
		back(50);
	}
	
	/**
	 * onHitWall: O que fazer quando bate na parede
	 */
	public void onHitWall(HitWallEvent e) {
		// Afasta-se da parede e vira para voltar ao combate
		back(30);
		turnLeft(90);
	}	
}
