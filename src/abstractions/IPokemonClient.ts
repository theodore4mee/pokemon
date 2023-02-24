import { Observable } from "rxjs";
import { IPokemon, IPokemonDetails } from "./IPokemon";

export interface IPokemonClient {
    getPokemons(): Observable<string>;
}

export interface IPokemonResponse {
    count: number;
    IsSuccessful: string,
    Message: string,
    Data: IListResponse
}

export interface IListResponse {
    count: number;
    next: number;
    previous: number;
    results: object[];
}

export interface IStats {
    pokemonAbility: any;
    pokemonWeight: string;
}