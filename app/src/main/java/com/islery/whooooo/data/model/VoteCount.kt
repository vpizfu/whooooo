package com.islery.whooooo.data.model

data class VotesCounter(
    val voteObjectIdentifier: String,
    val firstItem: List<firstItem>,
    val secondItem: List<secondItem>
)

data class firstItem(
    val userId: String
)

data class secondItem(
    val userId: String
)