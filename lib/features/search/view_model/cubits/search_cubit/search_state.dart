part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {}

class SearchFailure extends SearchState {}

// class SearchRecentlyAdded extends SearchState {}

class SearchRecentlyDelete extends SearchState {}
