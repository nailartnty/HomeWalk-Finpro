// to parse this json data, gunakan
//
//     final recipesModel = recipesModelFromJson(jsonString);
// ini adalah catatan petunjuk untuk pengguna yang ingin memproses data json
// data json diubah menjadi model dart menggunakan fungsi recipesModelFromJson

import 'dart:convert';
// mengimpor library dart:convert
// library ini digunakan untuk mengonversi data dari dan ke format json

RecipesModel recipesModelFromJson(String str) =>
    RecipesModel.fromJson(json.decode(str));
// fungsi ini mengonversi string json menjadi objek RecipesModel
// json.decode mengubah string json menjadi map (struktur key-value)
// lalu, map tersebut diubah menjadi objek RecipesModel menggunakan fungsi fromJson

String recipesModelToJson(RecipesModel data) => json.encode(data.toJson());
// fungsi ini mengubah objek RecipesModel menjadi string json
// data.toJson menghasilkan map dari objek RecipesModel
// lalu, json.encode mengubah map tersebut menjadi string json

class RecipesModel {
  // class ini merepresentasikan model data utama untuk resep

  List<Recipe> recipes;
  // daftar objek Recipe, yaitu data resep
  int total;
  // total jumlah resep
  int skip;
  // jumlah data yang dilewati (skip)
  int limit;
  // jumlah maksimal data yang ditampilkan (limit)

  RecipesModel({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });
  // constructor untuk membuat objek RecipesModel
  // semua parameter harus diisi karena menggunakan required

  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
        recipes:
            List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
        // mengubah setiap elemen dalam json["recipes"] menjadi objek Recipe
        // menggunakan fungsi fromJson di dalam class Recipe
        total: json["total"],
        // mengambil nilai total dari json
        skip: json["skip"],
        // mengambil nilai skip dari json
        limit: json["limit"],
        // mengambil nilai limit dari json
      );

  Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
        // mengubah setiap objek Recipe dalam daftar menjadi map json
        "total": total,
        // menambahkan nilai total ke dalam map json
        "skip": skip,
        // menambahkan nilai skip ke dalam map json
        "limit": limit,
        // menambahkan nilai limit ke dalam map json
      };
}

class Recipe {
  // class ini merepresentasikan data individual untuk setiap resep

  int id;
  String name;
  List<String> ingredients;
  List<String> instructions;
  int prepTimeMinutes;
  int cookTimeMinutes;
  int servings;
  Difficulty difficulty;
  String cuisine;
  int caloriesPerServing;
  List<String> tags;
  int userId;
  String image;
  double rating;
  int reviewCount;
  List<String> mealType;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        prepTimeMinutes: json["prepTimeMinutes"],
        cookTimeMinutes: json["cookTimeMinutes"],
        servings: json["servings"],
        difficulty: difficultyValues.map[json["difficulty"]]!,
        cuisine: json["cuisine"],
        caloriesPerServing: json["caloriesPerServing"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        userId: json["userId"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        reviewCount: json["reviewCount"],
        mealType: List<String>.from(json["mealType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "prepTimeMinutes": prepTimeMinutes,
        "cookTimeMinutes": cookTimeMinutes,
        "servings": servings,
        "difficulty": difficultyValues.reverse[difficulty],
        "cuisine": cuisine,
        "caloriesPerServing": caloriesPerServing,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "userId": userId,
        "image": image,
        "rating": rating,
        "reviewCount": reviewCount,
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
      };
}

enum Difficulty { EASY, MEDIUM }

final difficultyValues =
    EnumValues({"Easy": Difficulty.EASY, "Medium": Difficulty.MEDIUM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}