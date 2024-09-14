// FireStore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/data/models/favorite_movie_model.dart';
import 'package:movies_app/data/models/movie_model.dart';

import '../firebase_auth/firebase_auth_service.dart';

const FAVORITE_MOVIES_COLLECTION_KEY = 'favoriteMovies';

class FirebaseStoreService {
  final moviesAppCollection = FirebaseFirestore.instance.collection('moviesapp');

  Future<String?> addFavoriteMovie(MovieModel movie) async{
    try {
      await moviesAppCollection
      .doc(FirebaseAuthService.getUser!.uid) // pegando  o doc onde tem o id do  usuário
      .collection(FAVORITE_MOVIES_COLLECTION_KEY) // para escolher qual a "tabela" que iremos acessar
      .add(movie.toMap()); 
      return null;
    } on FirebaseAuthException {
      return "Erro ao adicionar o filme aos favoritos.";
    }
  }

  Stream<List<FavoriteMovieModel>> get getFavoriteMovies => // é uma stream pq o firestore funciona como uma stream e conseguimos atualizar a lista de favoritos em tempo real.
  moviesAppCollection.doc(FirebaseAuthService.getUser!.uid)
  .collection(FAVORITE_MOVIES_COLLECTION_KEY)
  .snapshots()
  .map(_getMOviesListFromSnapShot);

  List<FavoriteMovieModel> _getMOviesListFromSnapShot(QuerySnapshot<Map<String, dynamic>> snapshot){
    return snapshot.docs.map((favoriteMovie) => FavoriteMovieModel.fromMap(favoriteMovie.data(), favoriteMovie.id)).toList();
  }

  Future<(String? error, String? successMessage)> removeFavoriteMovie(FavoriteMovieModel favoriteMovie) async{

    try {
      await moviesAppCollection
      .doc(FirebaseAuthService.getUser!.uid) // pegando  o doc onde tem o id do  usuário
      .collection(FAVORITE_MOVIES_COLLECTION_KEY)
      .doc(favoriteMovie.favoriteId)
      .delete();
      return(null, "Filme removito dos favoritos.");
    } on FirebaseException {
      return("Erro ao remover o filme dos favoritos", null);
    }
  }
}