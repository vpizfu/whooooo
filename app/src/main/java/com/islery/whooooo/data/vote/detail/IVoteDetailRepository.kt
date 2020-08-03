package com.islery.whooooo.data.vote.detail

interface IVoteDetailRepository {
    fun voteForFirstItem(voteId: String)
    fun voteForSecondItem(voteId: String)
}