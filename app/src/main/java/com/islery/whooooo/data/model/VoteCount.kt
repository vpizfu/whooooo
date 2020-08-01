package com.islery.whooooo.data.model

data class voteObject(
    val voteObjectId: String,
    val one: List<one>,
    val two: List<two>
)

data class one(
    val userId: String
)

data class two(
    val userId: String
)