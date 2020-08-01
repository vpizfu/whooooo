package com.islery.whooooo.data.model

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class VoteEvent(val name: String, val one: String, val two: String) : Parcelable