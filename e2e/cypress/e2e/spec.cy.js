
import { And, Given, Then, When } from 'cypress-cucumber-preprocessor/steps';

//There's a way to create test features files with cucmber to make document the tests and their descriptions

describe('Pokemon spec', () => {

  it("User visits Pokemon website", () => {
    cy.visit('http://localhost:4200/home');
    cy.contains('Bulbasaur').click();
    cy.url().should('include', '/details/bulbasaur/1');
  })
});