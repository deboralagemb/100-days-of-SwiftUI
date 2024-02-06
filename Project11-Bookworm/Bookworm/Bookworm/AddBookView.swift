//
//  AddBookView.swift
//  Bookworm
//
//  Created by Débora Lage on 06/02/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Unknown"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Unknown"]
    var isValidBook: Bool {
        if title.isOnlySpaces || author.isOnlySpaces || review.isOnlySpaces {
            return false
        }
        
        return true
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(isValidBook == false)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}

extension String {
    var isOnlySpaces: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
