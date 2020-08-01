package com.islery.whooooo.data.model

import android.os.Parcelable
import android.service.carrier.CarrierIdentifier
import android.text.BoringLayout
import kotlinx.android.parcel.Parcelize

@Parcelize
data class VoteEvent(
    val dateFrom: Long = 0,
    val dateTo: Long = 0,
    val identifier: String = "",
    val name: String = "",
    val firstItem: String = "",
    val secondItem: String = "",
    val active: Boolean
) : Parcelable