//
//  main.swift
//  Menghitung Balok
//
//  Created by Muhammad Rafi Aditya on 04/05/25.
//

/*
// Tugas Pertama
import Foundation

// MARK: Membuat form menghitung balok.
print("Selamat Datang di Dicoding Academy")

// MARK: Memasukkan data dummy dari pengguna.
let panjang = 4.0 // Length
let lebar = 2.0 // Width
let tinggi = 3.0 // Height

// MARK: Mengitung Volume, Luas dan Keliling.
let volume = panjang * lebar * tinggi
let luas = 2 * ((lebar * panjang) + (lebar * tinggi) + (panjang * tinggi))
let keliling = 4 * (panjang + lebar + tinggi)
print("---------------------------------------")

// MARK: Output dari program yang Anda buat.
print("Anda memiliki sebuah balok dengan: ")
print("1. Panjangnya adalah \(panjang) CM.")
print("2. Lebarnya adalah \(lebar) CM.")
print("3. Tingginya adalah \(tinggi) CM.")
print("4. Volumenya adalah \(volume) CM3.")
print("5. Luas Permukaannya adalah \(luas) CM2.")
print("6. Kelilingnya adalah \(keliling) CM.")
print("---------------------------------------")
*/

//Tugas Kedua
import Foundation

// MARK: Membuat form menghitung balok.
print("Selamat Datang di Dicoding Academy")

// MARK: Memasukkan input dari pengguna.
print("Masukkanlah Panjang balok: "); let panjangInput = readLine()
print("Masukkanlah Lebar balok: "); let lebarInput = readLine()
print("Masukkanlah Tinggi balok: "); let tinggiInput = readLine()

// MARK: Mengubah dari String ke Double.
if let panjang = Double(panjangInput ?? "0"),
   let lebar = Double(lebarInput ?? "0"),
   let tinggi = Double(tinggiInput ?? "0") {
    
    // MARK: Menghitung Volume, Luas, dan Keliling dari input yang didapatkan.
    let volume = panjang * lebar * tinggi
    let luas = 2 * ((panjang * lebar) + (panjang * tinggi) + (lebar * tinggi))
    let keliling = 4 * (panjang + lebar + tinggi)
    
    // MARK: Output dari program yang Anda buat.
    print("---------------------------------------")
    print("1. Panjangnya adalah \(panjang) CM.")
    print("2. Lebarnya adalah \(lebar) CM.")
    print("3. Tingginya adalah \(tinggi) CM.")
    print("4. Volumenya adalah \(volume) CM3.")
    print("5. Luas Permukaannya adalah \(luas) CM2.")
    print("6. Kelilingnya adalah \(keliling) CM.")
    print("---------------------------------------")
    
} else {
    
    // MARK: Memproses ketika input tidak valid.
    print("---------------------------------------")
    print("Input Tidak Valid")
    print("---------------------------------------")
}
