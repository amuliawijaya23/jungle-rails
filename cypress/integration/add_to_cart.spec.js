describe("adding to cart", () => {
  
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  });

  it("should add item to the cart", () => {
    cy.contains("Add").first().click({force: true});
    cy.contains("My Cart (1)");
  });

})