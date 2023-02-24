import { HttpClient, HttpHeaders } from "@angular/common/http";
import { IPokemon } from "../abstractions/IPokemon";
import { IPokemonClient } from "../abstractions/IPokemonClient";
import { Injectable, Inject, Optional, InjectionToken } from '@angular/core';
import { getPokemonDetails, getAll, baseUrl } from "../abstractions/Constants";
import { Observable, throwError as _observableThrow, of as _observableOf } from 'rxjs';
import { mergeMap as _observableMergeMap, catchError as _observableCatch } from 'rxjs/operators';

@Injectable() 
export class PokemonHttpClient implements IPokemonClient {
    private url: string = baseUrl;
    private all: string = getAll;
    private details: string = getPokemonDetails;
    private _httpClient: HttpClient;
    private _IPokemon: IPokemon = { name: '' };

    //This can be moved to constants file
    private options_: any = {
        body: "",
        headers: new HttpHeaders({
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*"
        })
    };

    constructor(@Inject(HttpClient) http: HttpClient) {
        this._httpClient = http;
    }

    getPokemons(): Observable<string> {
        let url = this.url + this.all;

        //This can be a fucntion to avoid repitition in line 43
        return this._httpClient.request("get", url, this.options_).pipe((response_ : any) => {
            return response_;
        });
    }

    getPokemonDetails(params: string): Observable<string> {
        let url = this.url + this.details + params;

        return this._httpClient.request("get", url, this.options_).pipe((response_ : any) => {
            return   response_;
        });
    }
}
