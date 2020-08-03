package com.islery.whooooo.data.model

import android.os.Parcelable
import android.service.carrier.CarrierIdentifier
import android.text.BoringLayout
import kotlinx.android.parcel.Parcelize

@Parcelize
data class VoteEvent(
    val identifier: String = "",
    val name: String = "",
    val firstItem: String = "",
    val secondItem: String = "",
    val firstVoteName: String = "",
    val secondVoteName: String = "",
    val active: Boolean = false,
    val dateFrom: Long = 0,
    val dateTo: Long = 0,
    val category: String = ""
) : Parcelable