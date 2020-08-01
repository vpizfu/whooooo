package com.islery.whooooo.data.list

import android.util.Log
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.ValueEventListener
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import com.islery.whooooo.data.model.VoteEvent

class ListRepositoryImpl : IListRepository {

    override fun getActiveVotes(onQueryResult: (res: QueryResult<List<VoteEvent>, String?>) -> Unit) {
        val dbRef = Firebase.database.getReference("votes")
        dbRef.addValueEventListener(object : ValueEventListener {
            override fun onCancelled(error: DatabaseError) {
                onQueryResult(QueryResult.Error(error.message))
            }

            override fun onDataChange(snapshot: DataSnapshot) {
                val list = snapshot.children
                val resData = mutableListOf<VoteEvent>()
                for (vote in list) {
                    val vt = vote.getValue(VoteEvent::class.java)
                    vt?.let {
                        if (vt.active) {
                            resData.add(vt)
                            Log.d("MY_TAG", "onDataChange: $vt")
                        }
                    }
                }
                onQueryResult(QueryResult.Success(resData))
            }

        })
    }

}