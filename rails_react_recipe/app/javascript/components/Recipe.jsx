import React, { useState, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

const Recipe = () => {
  const params = useParams();
  const navigate = useNavigate();
  const [recipe, setRecipe] = useState({ ingredients: "" });

  // grabbing recipe data from server
  useEffect(() => {
    const url = `/api/v1/show/${params.id}`;
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => setRecipe(response))
      .catch(() => navigate("/recipes"));
  }, [params.id]);
};

export default Recipe;
