package com.islery.whooooo.data.vote.detail

import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase

class VoteDetailRepositoryImpl: IVoteDetailRepository {
    private val dbReference = Firebase.database.getReference(("votesCounter"))
    override fun voteForFirstItem(voteId: String) {
        dbReference.child(voteId).child("firstItem").push().setValue("1")
    }

    override fun voteForSecondItem(voteId: String) {
        dbReference.child(voteId).child("secondItem").push().setValue("1")
    }
}