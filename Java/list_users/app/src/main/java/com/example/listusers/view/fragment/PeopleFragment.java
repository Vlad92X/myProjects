package com.example.listusers.view.fragment;


import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.core.content.ContextCompat;
import androidx.databinding.DataBindingUtil;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.listusers.R;
import com.example.listusers.api.RandomUserAPI;
import com.example.listusers.api.model.RandomUserResponse;
import com.example.listusers.databinding.PeopleFragmentBinding;
import com.example.listusers.view.adapter.PeopleListAdapter;
import com.example.listusers.view.widget.DividerItemDecoration;

import org.jetbrains.annotations.Nullable;

import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;





/**
 * This fragment contains a RecyclerView to show the list of users
 */
public class PeopleFragment extends Fragment {

    PeopleFragmentBinding mPeopleFragmentBinding;
    PeopleListAdapter mPeopleListAdapter;

    private boolean mIsTabletLayout;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        mPeopleFragmentBinding = DataBindingUtil.inflate(inflater, R.layout.people_fragment, container, false);
        mIsTabletLayout = false;
        Log.d("MyLog", "1iter=  : ");
        return mPeopleFragmentBinding.getRoot();
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        final RandomUserAPI randomUserAPI = RandomUserAPI.Factory.create();

        Log.d("MyLog", "1iter=  : "+randomUserAPI.toString());
        randomUserAPI.getRandomUsers(5)//result - user
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Subscriber<RandomUserResponse>() {
                    @Override
                    public void onCompleted() {
                        Log.d("MyLog", "onCompleted()");
                    }

                    @Override
                    public void onError(Throwable e) {
                        Log.e("People", e.getMessage());
                        Log.d("MyLog", e.getMessage());
                    }

                    @Override
                    public void onNext(RandomUserResponse response) {
                        mPeopleFragmentBinding.rvPeopleList.setLayoutManager(setLayoutManager());
                        mPeopleFragmentBinding.rvPeopleList.setHasFixedSize(true);
                        mPeopleListAdapter = new PeopleListAdapter(getContext(), response.getResults());
                        mPeopleFragmentBinding.rvPeopleList.setAdapter(mPeopleListAdapter);
                        Log.d("MyLog","!!!!!!!!!!!!!!");
                    }
                });
    }

    private RecyclerView.LayoutManager setLayoutManager() {
        RecyclerView.LayoutManager layoutManager;
        if (!mIsTabletLayout) {
            layoutManager = new LinearLayoutManager(getActivity());
            Drawable dividerDrawable = ContextCompat.getDrawable(getContext(), R.drawable.divider_drawable);
            mPeopleFragmentBinding.rvPeopleList.addItemDecoration(new DividerItemDecoration(dividerDrawable));

        } else {
            GridLayoutManager gridLayoutManager = new GridLayoutManager(getActivity(), 3);
            gridLayoutManager.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() {
                @Override
                public int getSpanSize(int position) {
                    return 1;
                }
            });
            layoutManager = gridLayoutManager;
        }
        return layoutManager;
    }
}