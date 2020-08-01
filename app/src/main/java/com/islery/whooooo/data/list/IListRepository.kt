package com.islery.whooooo.data.list

import com.islery.whooooo.data.model.VoteEvent
import com.islery.whooooo.data.register.AuthResult

interface IListRepository {
    fun getActiveVotes(onQueryResult: (res: QueryResult<List<VoteEvent>, String?>) -> Unit)
}

sealed class QueryResult<out A, out B> {
    data class Success<out A>(val data: A) : QueryResult<A, Nothing>()
    data class Error<out B>(val msg: B) : QueryResult<Nothing, B>()
}