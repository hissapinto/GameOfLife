//
//  GameOfLife.swift
//  GameOfLife
//
//  Created by Isabela Hissa Pinto on 19/09/25.
//
import Foundation

//vivas = 1 ou 2(eram vivas e viraram mortas)
//mortas = 0 ou 3(eram mortas e viraram vivas)
func proximaMatriz(mat: inout [[Int]]) {
    let x: Int = mat[0].count - 1
    let y: Int = mat.count - 1
    let direcoes: [[Int]] = [[-1,-1], [0, -1],[1, -1],
                             [-1, 0],/*[i,j]*/[1, 0],
                             [-1, 1], [0, 1], [1, 1]]
    
    for i in 0...y {
        for j in 0...x {
            var vivas: Int = 0
            
            for dir in direcoes {
                let posY = i+dir[1]
                let posX = j+dir[0]
                if posY >= 0 && posX >= 0 && posY <= y && posX <= x && (mat[posY][posX] == 1 || mat[posY][posX] == 2) {
                    vivas += 1
                }
            }
            if mat[i][j] == 1 { //se viva
                if vivas >= 2 && vivas <= 3 {
                    mat[i][j] = 1
                } else {
                    mat[i][j] = 2
                }
            }
            if mat[i][j] == 0 {// se morta
                if vivas == 3 {
                    mat[i][j] = 3
                } else {
                    mat[i][j] = 0
                }
            }
        }
    }
    for i in 0...y {
        for j in 0...x {
            if mat[i][j] == 2 || mat[i][j] == 3 {
                mat[i][j] -= 2
            }
        }
    }
}

func printMatriz(mat:[[Int]]){
    let x: Int = mat[0].count - 1
    let y: Int = mat.count - 1
    var linha: String = ""
    for i in 0...y {
        for j in 0...x {
            if mat[i][j] == 0 {
                linha += "⬛️ "
            } else {
                linha += "🟪 "
            }
        }
        print(linha)
        linha = ""
    }
}

//func clearScreen() {
//    print("\u{001B}[2J\u{001B}[H", terminator: "")
//}

//alocar matriz em forma de vetor para melhor performace | vetor = matrix.x * matriz.y
//para saber de tem vizinhos sufucientes soma todos os 1 dentro da vizinhança,
//que é 4 celulas para o lado e 4 para outro
